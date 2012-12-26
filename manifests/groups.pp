class user_management::groups ( $groups = hiera("groups") ) {
  if $groups {
    create_resources(user_management::group, $groups)
  }
}
