#! /bin/sh

set -e

autoconf
autoheader
for rmk in conf/*.rmk; do
  ruby genmk.rb < $rmk > `echo $rmk | sed 's/\.rmk$/.mk/'`
done

rm -f config.sub config.guess
ln -s /usr/share/misc/config.sub .
ln -s /usr/share/misc/config.guess .

exit 0
