define user_management::group ($system=false, $groupname=$title) {
    group { $groupname:
        ensure  => present,
	system	=> $system
    }
}
