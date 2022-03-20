# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

<<<<<<< HEAD
mesg n || true
=======
mesg n 2> /dev/null || true
>>>>>>> a08304ff497e0ba75e3e55524bdb2981917cffee
