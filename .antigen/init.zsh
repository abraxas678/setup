#-- START ZCACHE GENERATED FILE
#-- GENERATED: Thu Mar 24 20:22:34 CET 2022
#-- ANTIGEN develop
_antigen () {
	local -a _1st_arguments
	_1st_arguments=('apply:Load all bundle completions' 'bundle:Install and load the given plugin' 'bundles:Bulk define bundles' 'cleanup:Clean up the clones of repos which are not used by any bundles currently loaded' 'cache-gen:Generate cache' 'init:Load Antigen configuration from file' 'list:List out the currently loaded bundles' 'purge:Remove a cloned bundle from filesystem' 'reset:Clears cache' 'restore:Restore the bundles state as specified in the snapshot' 'revert:Revert the state of all bundles to how they were before the last antigen update' 'selfupdate:Update antigen itself' 'snapshot:Create a snapshot of all the active clones' 'theme:Switch the prompt theme' 'update:Update all bundles' 'use:Load any (supported) zsh pre-packaged framework') 
	_1st_arguments+=('help:Show this message' 'version:Display Antigen version') 
	__bundle () {
		_arguments '--loc[Path to the location <path-to/location>]' '--url[Path to the repository <github-account/repository>]' '--branch[Git branch name]' '--no-local-clone[Do not create a clone]'
	}
	__list () {
		_arguments '--simple[Show only bundle name]' '--short[Show only bundle name and branch]' '--long[Show bundle records]'
	}
	__cleanup () {
		_arguments '--force[Do not ask for confirmation]'
	}
	_arguments '*:: :->command'
	if (( CURRENT == 1 ))
	then
		_describe -t commands "antigen command" _1st_arguments
		return
	fi
	local -a _command_args
	case "$words[1]" in
		(bundle) __bundle ;;
		(use) compadd "$@" "oh-my-zsh" "prezto" ;;
		(cleanup) __cleanup ;;
		(update|purge) compadd $(type -f \-antigen-get-bundles &> /dev/null || antigen &> /dev/null; -antigen-get-bundles --simple 2> /dev/null) ;;
		(theme) compadd $(type -f \-antigen-get-themes &> /dev/null || antigen &> /dev/null; -antigen-get-themes 2> /dev/null) ;;
		(list) __list ;;
	esac
}
antigen () {
  local MATCH MBEGIN MEND
  [[ "$ZSH_EVAL_CONTEXT" =~ "toplevel:*" || "$ZSH_EVAL_CONTEXT" =~ "cmdarg:*" ]] && source "/home/abraxas678/antigen.zsh" && eval antigen $@;
  return 0;
}
typeset -gaU fpath path
fpath+=(/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/lib /home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/git /home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/pip /home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/command-not-found /home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/z /home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/colored-man-pages /home/abraxas678/.antigen/bundles/zsh-users/zsh-syntax-highlighting /home/abraxas678/.antigen/bundles/zsh-users/zsh-completions /home/abraxas678/.antigen/bundles/zsh-users/zsh-autosuggestions /home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/magic-enter /home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/copypath /home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/safe-paste /home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/tmux /home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/fzf /home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/cp /home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/copybuffer /home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/thefuck /home/abraxas678/.antigen/bundles/SinaKhalili/sina /home/abraxas678/.antigen/bundles/SinaKhalili/ignore-dollarsign /home/abraxas678/.antigen/bundles/desyncr/auto-ls /home/abraxas678/.antigen/bundles/andrewferrier/fzf-z /home/abraxas678/.antigen/bundles/voronkovich/gitignore.plugin.zsh /home/abraxas678/.antigen/bundles/romkatv/powerlevel10k) path+=(/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/lib /home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/git /home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/pip /home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/command-not-found /home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/z /home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/colored-man-pages /home/abraxas678/.antigen/bundles/zsh-users/zsh-syntax-highlighting /home/abraxas678/.antigen/bundles/zsh-users/zsh-completions /home/abraxas678/.antigen/bundles/zsh-users/zsh-autosuggestions /home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/magic-enter /home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/copypath /home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/safe-paste /home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/tmux /home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/fzf /home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/cp /home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/copybuffer /home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/thefuck /home/abraxas678/.antigen/bundles/SinaKhalili/sina /home/abraxas678/.antigen/bundles/SinaKhalili/ignore-dollarsign /home/abraxas678/.antigen/bundles/desyncr/auto-ls /home/abraxas678/.antigen/bundles/andrewferrier/fzf-z /home/abraxas678/.antigen/bundles/voronkovich/gitignore.plugin.zsh /home/abraxas678/.antigen/bundles/romkatv/powerlevel10k)
_antigen_compinit () {
  autoload -Uz compinit; compinit -i -d "/home/abraxas678/.antigen/.zcompdump"; compdef _antigen antigen
  add-zsh-hook -D precmd _antigen_compinit
}
autoload -Uz add-zsh-hook; add-zsh-hook precmd _antigen_compinit
compdef () {}

if [[ -n "/home/abraxas678/.oh-my-zsh" ]]; then
  ZSH="/home/abraxas678/.oh-my-zsh"; ZSH_CACHE_DIR="/home/abraxas678/.oh-my-zsh/cache/"
fi
#--- BUNDLES BEGIN
source '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/lib/bzr.zsh';
source '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/lib/cli.zsh';
source '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/lib/clipboard.zsh';
source '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/lib/compfix.zsh';
source '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/lib/completion.zsh';
source '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/lib/correction.zsh';
source '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/lib/diagnostics.zsh';
source '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/lib/directories.zsh';
source '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/lib/functions.zsh';
source '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/lib/git.zsh';
source '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/lib/grep.zsh';
source '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/lib/history.zsh';
source '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/lib/key-bindings.zsh';
source '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/lib/misc.zsh';
source '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/lib/nvm.zsh';
source '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/lib/prompt_info_functions.zsh';
source '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/lib/spectrum.zsh';
source '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/lib/termsupport.zsh';
source '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/lib/theme-and-appearance.zsh';
source '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/lib/vcs_info.zsh';
source '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/git/git.plugin.zsh';
source '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/pip/pip.plugin.zsh';
source '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/command-not-found/command-not-found.plugin.zsh';
source '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/z/z.plugin.zsh';
source '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/colored-man-pages/colored-man-pages.plugin.zsh';
source '/home/abraxas678/.antigen/bundles/zsh-users/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh';
source '/home/abraxas678/.antigen/bundles/zsh-users/zsh-completions/zsh-completions.plugin.zsh';
source '/home/abraxas678/.antigen/bundles/zsh-users/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh';
source '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/magic-enter/magic-enter.plugin.zsh';
source '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/copypath/copypath.plugin.zsh';
source '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/safe-paste/safe-paste.plugin.zsh';
source '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/tmux/tmux.plugin.zsh';
source '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/fzf/fzf.plugin.zsh';
source '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/cp/cp.plugin.zsh';
source '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/copybuffer/copybuffer.plugin.zsh';
source '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/thefuck/thefuck.plugin.zsh';
source '/home/abraxas678/.antigen/bundles/SinaKhalili/sina/sina.plugin.zsh';
source '/home/abraxas678/.antigen/bundles/SinaKhalili/ignore-dollarsign/ignore_dollarsign.plugin.zsh';
source '/home/abraxas678/.antigen/bundles/desyncr/auto-ls/auto-ls.zsh';
source '/home/abraxas678/.antigen/bundles/andrewferrier/fzf-z/fzf-z.plugin.zsh';
source '/home/abraxas678/.antigen/bundles/voronkovich/gitignore.plugin.zsh/gitignore.plugin.zsh';
source '/home/abraxas678/.antigen/bundles/romkatv/powerlevel10k/powerlevel10k.zsh-theme.antigen-compat';

#--- BUNDLES END
typeset -gaU _ANTIGEN_BUNDLE_RECORD; _ANTIGEN_BUNDLE_RECORD=('https://github.com/robbyrussell/oh-my-zsh.git lib plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/git plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/pip plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/command-not-found plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/z plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/colored-man-pages plugin true' 'https://github.com/zsh-users/zsh-syntax-highlighting.git / plugin true' 'https://github.com/zsh-users/zsh-completions.git / plugin true' 'https://github.com/zsh-users/zsh-autosuggestions.git / plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/magic-enter plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/copypath plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/safe-paste plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/tmux plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/fzf plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/cp plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/copybuffer plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/thefuck plugin true' 'https://github.com/SinaKhalili/sina.git / plugin true' 'https://github.com/SinaKhalili/ignore-dollarsign.git / plugin true' 'https://github.com/desyncr/auto-ls.git / plugin true' 'https://github.com/andrewferrier/fzf-z.git / plugin true' 'https://github.com/voronkovich/gitignore.plugin.zsh.git / plugin true' 'https://github.com/romkatv/powerlevel10k.git / theme true')
typeset -g _ANTIGEN_CACHE_LOADED; _ANTIGEN_CACHE_LOADED=true
typeset -ga _ZCACHE_BUNDLE_SOURCE; _ZCACHE_BUNDLE_SOURCE=('/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/lib' '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/lib/bzr.zsh' '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/lib/cli.zsh' '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/lib/clipboard.zsh' '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/lib/compfix.zsh' '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/lib/completion.zsh' '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/lib/correction.zsh' '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/lib/diagnostics.zsh' '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/lib/directories.zsh' '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/lib/functions.zsh' '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/lib/git.zsh' '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/lib/grep.zsh' '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/lib/history.zsh' '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/lib/key-bindings.zsh' '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/lib/misc.zsh' '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/lib/nvm.zsh' '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/lib/prompt_info_functions.zsh' '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/lib/spectrum.zsh' '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/lib/termsupport.zsh' '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/lib/theme-and-appearance.zsh' '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/lib/vcs_info.zsh' '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/git' '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/git/git.plugin.zsh' '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/pip' '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/pip/pip.plugin.zsh' '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/command-not-found' '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/command-not-found/command-not-found.plugin.zsh' '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/z' '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/z/z.plugin.zsh' '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/colored-man-pages' '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/colored-man-pages/colored-man-pages.plugin.zsh' '/home/abraxas678/.antigen/bundles/zsh-users/zsh-syntax-highlighting//' '/home/abraxas678/.antigen/bundles/zsh-users/zsh-syntax-highlighting///zsh-syntax-highlighting.plugin.zsh' '/home/abraxas678/.antigen/bundles/zsh-users/zsh-completions//' '/home/abraxas678/.antigen/bundles/zsh-users/zsh-completions///zsh-completions.plugin.zsh' '/home/abraxas678/.antigen/bundles/zsh-users/zsh-autosuggestions//' '/home/abraxas678/.antigen/bundles/zsh-users/zsh-autosuggestions///zsh-autosuggestions.plugin.zsh' '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/magic-enter' '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/magic-enter/magic-enter.plugin.zsh' '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/copypath' '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/copypath/copypath.plugin.zsh' '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/safe-paste' '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/safe-paste/safe-paste.plugin.zsh' '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/tmux' '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/tmux/tmux.plugin.zsh' '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/fzf' '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/fzf/fzf.plugin.zsh' '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/cp' '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/cp/cp.plugin.zsh' '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/copybuffer' '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/copybuffer/copybuffer.plugin.zsh' '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/thefuck' '/home/abraxas678/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/thefuck/thefuck.plugin.zsh' '/home/abraxas678/.antigen/bundles/SinaKhalili/sina//' '/home/abraxas678/.antigen/bundles/SinaKhalili/sina///sina.plugin.zsh' '/home/abraxas678/.antigen/bundles/SinaKhalili/ignore-dollarsign//' '/home/abraxas678/.antigen/bundles/SinaKhalili/ignore-dollarsign///ignore_dollarsign.plugin.zsh' '/home/abraxas678/.antigen/bundles/desyncr/auto-ls//' '/home/abraxas678/.antigen/bundles/desyncr/auto-ls///auto-ls.plugin.zsh' '/home/abraxas678/.antigen/bundles/andrewferrier/fzf-z//' '/home/abraxas678/.antigen/bundles/andrewferrier/fzf-z///fzf-z.plugin.zsh' '/home/abraxas678/.antigen/bundles/voronkovich/gitignore.plugin.zsh//' '/home/abraxas678/.antigen/bundles/voronkovich/gitignore.plugin.zsh///gitignore.plugin.zsh' '/home/abraxas678/.antigen/bundles/romkatv/powerlevel10k//' '/home/abraxas678/.antigen/bundles/romkatv/powerlevel10k///powerlevel10k.zsh-theme')
typeset -g _ANTIGEN_CACHE_VERSION; _ANTIGEN_CACHE_VERSION='develop'
typeset -g _ANTIGEN_THEME; _ANTIGEN_THEME='romkatv/powerlevel10k /'

#-- END ZCACHE GENERATED FILE
