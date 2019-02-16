git submodule update --init --recursive
cd pdk-ide-auto-complete
./initialize_project.sh
cd ../
[ ! -s hexo-generator-php-apidoc ] && ln -s node_modules/hexo-generator-php-apidoc hexo-generator-php-apidoc
[ ! -s hexo-generator-cpp-apidoc ] && ln -s node_modules/hexo-generator-cpp-apidoc hexo-generator-cpp-apidoc