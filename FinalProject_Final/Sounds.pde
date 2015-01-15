// Sounds
Minim minim;
AudioPlayer current, m_menu, m_game;
AudioPlayer s_fire, s_hit, s_dead;

AudioPlayer GetCurrentPlayingMusic() { return current; }

void InitSounds()
{
  minim = new Minim(this);
  
  current = null;
  
  m_menu   = Custom_LoadMusic("mainmenu.mp3");
  m_game   = Custom_LoadMusic("maingame.mp3");
  
  s_fire   = Custom_LoadSFX("shoot.mp3");
  s_hit    = Custom_LoadSFX("hit_hurt.mp3");
  s_dead   = Custom_LoadSFX("explosion2.mp3");
  
  UpdateMusic();
}

// Updates Music based on game context
void UpdateMusic()
{
  switch(game_state)
  {
    case GAME_STATE_MAIN_MENU:       
      PlayMusic(m_menu);
      break;
    case GAME_STATE_RUNNING:
      PlayMusic(m_game);
      break;
    default:
      debugPrint("Error! Invalid game state. (UpdateMusic())");
      current = null;
      break;
  }
}

AudioPlayer Custom_LoadMusic(String filename)
{ 
  return minim.loadFile("./Sounds/Music/" + filename);
}

AudioPlayer Custom_LoadSFX(String filename)
{ 
  println("Loading:", filename);
  return minim.loadFile("./Sounds/SFX/" + filename);
}

void PlayMusic(AudioPlayer music)
{
  if(current != null) 
    current.pause();
  
  current = music;
  
  current.rewind();
  current.loop();
}
