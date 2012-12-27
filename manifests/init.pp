class user_management () {
  $groups = hiera("groups")
  if $groups {
    create_resources(user_management::group, $groups)
  }

  $users = hiera("users")
  if $users {
    create_resources(user_management::user, $users)
  }
}

