class user_machine($user_name = undef, $include_development = false) {
  
  if ($user_name == undef) {
    fail('USer name must be specified')
  }

  include user_machine::basics

  if ($include_development) {
    include user_machine::development
  }
}
