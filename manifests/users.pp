class user_management::users ( $users = hiera("users") ) {
  if $users {
    create_resources(user_management::user, $users)
  }
}

