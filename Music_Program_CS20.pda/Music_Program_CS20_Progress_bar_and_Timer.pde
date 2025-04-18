void Music_Program_CS20_ProgressBar () {
  if (SongPlayList[SongPlaying].isPlaying()) {
    SongTimeCounter = millis();
  }
  ProgressWidth = map(SongPlayList[SongPlaying].position(), 0, AlteredCurrentSongLength, 0, widthMusicProgressBar);
  ProgressWidth = constrain(ProgressWidth, 0, widthMusicProgressBar);
  noStroke();
  fill(TextPurple);
  rect(xMusicProgressBar, yMusicProgressBar, ProgressWidth, heightMusicProgressBar);
  strokeWeight(4);
  stroke(Purple);
  noFill();
  rect(xMusicProgressBar, yMusicProgressBar,  widthMusicProgressBar, heightMusicProgressBar);
  strokeWeight(1);
  stroke(Black);
  fill(resetDefaultInk);
}
void Music_Program_CS20_ProgressTimer () {
  int CurrentSongTime = SongPlayList[SongPlaying].position();
  int TotalSongTime = AlteredCurrentSongLength;
  int CurrentSongPositionMinutes = CurrentSongTime / 60000;
  int CurrentSongPositionSeconds = (CurrentSongTime / 1000) % 60;
  int TotalSongMinutes = TotalSongTime / 60000;
  int TotalSongSeconds = (TotalSongTime / 1000) % 60;
  fill(TextPurple);
  textAlign(CENTER, CENTER);
  textSize(20);
  text(
    nf(CurrentSongPositionMinutes, 2) + ":" + nf(CurrentSongPositionSeconds, 2) + " / " +
    nf(TotalSongMinutes, 2) + ":" + nf(TotalSongSeconds, 2),
    xMusicProgressBar + widthMusicProgressBar - textWidth("/" +
        nf(TotalSongMinutes, 2) + ":" + nf(TotalSongSeconds, 2)
    ),
    yMusicProgressBar + heightMusicProgressBar + appHeight*3/160
  );
  fill(resetDefaultInk);
}
