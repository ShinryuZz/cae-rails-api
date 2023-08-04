# module Api
#   module V1
#     class AuthenticationsController < ApplicationController
#       include FirebaseAuth
#       before_action :set_auth, only: %i[create]

#       def create
#         create_user(@auth)
#       end

#       private

#       def create_user(auth)
#         render json: auth, status: :unauthorized and return unless auth[:data]
#         uid = auth[:data][:uid]
#         render json: { message: '登録済みです' } and return if User.find_by(uid: uid)

#         user = User.new(uid: uid)
#         if user.save
#           render json: { message: '登録しましました' }
#         else
#           render json: user.errors.messages, status: :unprocessable_entity
#         end
#       end

#       def set_auth
#         @auth = authenticate_token
#       end
#     end
#   end
# end

module Api
  module V1
    class AuthenticationsController < ApplicationController
      def create
        render json: { message: "User successfully logged in!", user: current_user } if current_user
      end

      def test
        # テスト用のHTTPリクエストヘッダーにトークンを含めます。
        # この例では、Authorizationヘッダーにトークンを含めています。
        logger.debug(request.headers['Authorization'])

        # `authenticate_token`メソッドを実行します。
        authenticate_token

        # もし正当なユーザーが特定された場合、current_userメソッドで取得できることを確認します。
        if current_user
          render json: { message: 'Authentication successful!', user_id: current_user.id }
        else
          render json: { message: 'Authentication failed!' }, status: :unauthorized
        end
      end
    end
  end
end

