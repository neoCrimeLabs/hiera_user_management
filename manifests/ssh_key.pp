define user_management::ssh_key(
    $username,
    $type,
    $key,
    $comment=$title
    ) {

    # doing it this way may take a few more lines, but gave a little more flexibility. :-)

    ssh_authorized_key { $title:
        ensure  => present,
        user    => $username,
        type    => $type,
        key     => $key,
    }
}
