$ brew install postgresql
==> Downloading http://ftp2.uk.postgresql.org/sites/ftp.postgresql.org/source/v8.4.2/postgresql-8.4.2.tar.bz2
######################################################################## 100.0%
==> ./configure --enable-thread-safety --with-bonjour --with-python --with-perl --with-gssapi --with-krb5 --with-openssl --with-libxml --with-libxsl
==> make install
==> Caveats
If this is your first install, create a database with:
    initdb /usr/local/var/postgres

Automatically load on login with:
    launchctl load -w /usr/local/Cellar/postgresql/8.4.2/org.postgresql.postgres.plist

Or start manually with:
    pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start

And stop with:
    pg_ctl -D /usr/local/var/postgres stop -s -m fast

If you want to install the postgres gem, including ARCHFLAGS is recommended:

    env ARCHFLAGS="-arch x86_64" gem install postgres
