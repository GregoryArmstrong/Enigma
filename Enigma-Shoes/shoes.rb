Shoes.app {
  @para = para "Guess a number, 1-5:"
  flow {
    rng = ["1", "2", "3", "4", "5"]
    @rng = rng.sample
    @edit = edit_line
    @push_me = button "Check Answer"
    @push_me.click {
    if @edit.text == @rng
      @para.replace "Victory Corgi!"
      @corgi = image(
        "http://41.media.tumblr.com/39cfe4d1acaf575be5cfee2798c36b46/tumblr_njvvbg3DqP1rm95kgo1_1280.jpg",
        top: 100,
        left: 100
        )
      animate do |i|
        @corgi.top += (-20..20).rand
        @corgi.left += (-20..20).rand
      end
    else
      @para.replace "Nope!"
    end
    }
  }
}
