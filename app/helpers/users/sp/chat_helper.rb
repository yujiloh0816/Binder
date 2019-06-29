module Users::Sp::ChatHelper
  def self_message?(chat_message)
    return "selfMessage" if chat_message.user.id == current_user.id
  end
end
