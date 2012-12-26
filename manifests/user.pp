define user_management::user(
    $uid,
    $gid,
    $gecos,
    $additional_groups,
    $ssh_keys={},
    $shell='bin/bash',
    $pwhash='',
    $username=$title
    ) {

    # Create a usergroup
    group { $username:
        ensure  => present,
        gid     => $gid,
    }

    user { $username:
        ensure      => present,
        uid         => $uid,
        gid         => $gid,
        groups      => $additional_groups,
        shell       => $shell,
        comment     => $gecos,
        managehome  => true,
        home        => "/home/${username}",
        require     => [
            Group[$additional_groups],
            Group[$username]
        ],

    }

    # Set password if available
    if $pwhash != '' {
        User <| title == $username |> { password => $pwhash }
    }

    file { "/home/${username}":
        ensure  => directory,
        owner   => $username,
        group   => $username,
        mode    => '0700',
	require => User[$username]
    }

    if $ssh_keys {
	# Build out the path/permissions here as it's only declaired once

        file { "/home/${username}/.ssh":
            ensure  => directory,
            owner   => $username,
            group   => $username,
            mode    => '0700',
            require => File["/home/${username}"],
        }

        file { "/home/${username}/.ssh/authorized_keys":
            ensure  => present,
            owner   => $username,
            group   => $username,
            mode    => '0600',
            require => File["/home/${username}/.ssh"],
        }

        Ssh_authorized_key {
            require =>  File["/home/${username}/.ssh/authorized_keys"]
        }


        $ssh_key_defaults = {
            username    => $username,
        }

        create_resources(user_management::ssh_key, $ssh_keys, $ssh_key_defaults)
    }
}
