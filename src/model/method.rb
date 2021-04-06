def get_admin_details
    un = validate_presence_of_input("What is your username", "You must enter a username")
    pw = validate_presence_of_input("What is your password", "You must enter a password")
    return un, pw
    # ["foo", "bar"]
end