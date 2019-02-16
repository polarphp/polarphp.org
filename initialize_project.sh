if [ ! -d pdk-ide-auto-complete ]
then
    git clone polarphp:polarphp/pdk-ide-auto-complete
    cd pdk-ide-auto-complete
    ./initialize_project.sh
fi
