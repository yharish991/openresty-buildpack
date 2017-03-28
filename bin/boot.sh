export APP_ROOT=$HOME

export LD_LIBRARY_PATH=$APP_ROOT/openresty/luajit/lib:$LD_LIBRARY_PATH

export PATH=$APP_ROOT/openresty/bin:$PATH

mkdir -p /tmp/staged/app/openresty/nginx/logs
touch /tmp/staged/app/openresty/nginx/logs/error.log
mkdir -p /tmp/staged/app/openresty/nginx/client_body_temp

mkdir -p $APP_ROOT/nginx/logs
touch $APP_ROOT/nginx/logs/error.log
touch $APP_ROOT/nginx/logs/access.log

cp -a $APP_ROOT/openresty/lualib /tmp/staged/app/openresty/lualib/

conf_file=$APP_ROOT/openresty/nginx/conf/nginx.conf
if [ -f $APP_ROOT/scripts/nginx.conf ]
then
  conf_file=$APP_ROOT/scripts/nginx.conf
fi

mv $conf_file $APP_ROOT/openresty/nginx/conf/orig.conf
erb $APP_ROOT/openresty/nginx/conf/orig.conf > $APP_ROOT/openresty/nginx/conf/nginx.conf

# start nginx
exec $APP_ROOT/openresty/nginx/sbin/nginx -c $APP_ROOT/openresty/nginx/conf/nginx.conf
