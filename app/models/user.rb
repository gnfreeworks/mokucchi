class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :upload_image, ImageUploader
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true
  # validates :password, presence: true, length: { minimum: 6}

  has_one :post, dependent: :destroy
  has_many :post_comments, dependent: :destroy


  # TwitterAPIでアカウント情報を取得
  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20],
        image: auth.info.image,
        name: auth.info.name,
        nickname: auth.info.nickname,
        location: auth.info.location
      )
    end
    user
  end

  # プロフィール情報をパスワード無しで更新できるようにする
  def update_without_current_password(params, *options)
    params.delete(:current_password)
 
    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end
 
    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end


  private

  # Eメールが無いと登録できないためダミーアドレス生成
  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end

end
