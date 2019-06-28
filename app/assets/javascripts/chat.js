if(/chat/.test(window.location.pathname)) {
  var path = window.location.pathname.split('/');
  var room_id = path[path.length - 1];
  // チャット１ トリガー ページへのアクセス
  // サブスクライバーを作成
  App.chat_room = App.cable.subscriptions.create({
    channel: "ChatRoomChannel",
    room_id: room_id
  },
  {
    connected: function() {},
    disconnected: function() {},
    // チャット６ トリガー サーバー側のbroadcast_to
    // dataを.messagesの最後に追加しviewで表示
    received: function(data) {
      $('.messages').append(data['content']);
    },
    // チャット４ トリガー App.chat_room.speakで呼び出し
    // サーバー側のspeakメソッドにdataを渡す
    speak: function(message) {
      return this.perform('speak', {
        message: message,
        room_id: room_id,
        user_id: $('meta[name="current_user_id"]').attr('content')
      });
    }
  });
  // チャット３ トリガー ユーザーからの送信（エンターキー）
  // App.chat_roomのspeakメソッドにdataを渡す
  $(document).on('keypress', '[data-behavior~=room_speaker]',function(event) {
    if (event.keyCode === 13) {
      App.chat_room.speak(event.target.value);
      event.target.value = '';
      return event.preventDefault();
    }
  });
}
