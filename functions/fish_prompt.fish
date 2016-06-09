set color_cwd e7c547
set color_datetime 74e22e
set color_host 66d9ef

set fish_color_cwd $color_cwd

# git config
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'verbose name'
set __fish_git_prompt_show_informative_status 'yes'

set __fish_git_prompt_color_branch fdfb1f
set __fish_git_prompt_color_upstream_ahead $color_datetime
set __fish_git_prompt_color_upstream_behind $fish_color_error

set __fish_git_prompt_char_stateseparator ''
set __fish_git_prompt_char_upstream_prefix ''
set __fish_git_prompt_char_dirtystate ' +'
set __fish_git_prompt_char_cleanstate ' ✔'
set __fish_git_prompt_char_stagedstate ' ~'
set __fish_git_prompt_char_untrackedfiles ' …'
set __fish_git_prompt_char_upstream_ahead ' ↑'
set __fish_git_prompt_char_upstream_behind ' ↓'

function delima
	switch $USER
		case root
			echo "# "
		case '*'
			echo "\$ "
	end
end


function fish_prompt
	set last_status $status

	if test $last_status -ne 0
		set_color $fish_color_error
		printf "FAIL %d\n" $last_status
	end

	printf "\n"

	set_color $color_datetime
	printf "[%s] " (date +"%H:%M:%S")

	set_color $color_host
	# printf "%s@%s:" $USER (hostname)

	set_color $fish_color_cwd
	printf "%s" (pwd)

	set_color normal
	printf "%s " (__fish_git_prompt " (git: %s)")

	set_color normal
	printf "\n%s" (delima)

	set_color normal
end
