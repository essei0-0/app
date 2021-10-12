class CommentChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "comment_channel"
  end

  def speak(data)
    ActionCable.server.broadcast('comment_channel', content: data['content'])
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
