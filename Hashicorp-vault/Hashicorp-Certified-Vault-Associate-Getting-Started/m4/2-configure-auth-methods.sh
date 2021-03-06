# We need to create a user in Userpass so we can log in
# But how do we do that?
# path-help to the rescue

vault path-help auth/userpass/

# Looks like we do that through the users path

vault path-help auth/userpass/users

vault path-help auth/userpass/users/something

# Let's write some data to create a new user

vault write auth/userpass/users/ned password=tacos

# We can also add a user through the UI
# We will add Amy who loves burritos

# Now we need to do a little config on the AppRole too

vault path-help auth/GloboAppRole

# Looks like we need to configure a role

vault path-help auth/GloboAppRole/role/something

# Okay armed with that we can create a new role for a web app
# secret_id_num_uses=1 means it can be use only one time with 1hour
vault write auth/GloboAppRole/role/webapp role_name="webapp" secret_id_num_uses=1 secret_id_ttl=2h
vault write auth/GloboAppRole/role/webapp role_name="jenkins" secret_id_num_uses=20 secret_id_ttl=2h

# List roles
vault list auth/{auth_method}/role
vault list auth/GloboAppRole/role
