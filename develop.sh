# builds if executable isn't foound
if [[ ! -f "tailwindcss" ]]
then
    sh build.sh
fi

# v -g run server.v


# compiles tailwind css & launches locally
rm -rf public static/css
./tailwindcss -i css/index.css -o ./static/css/index.css --watch & v run server.v

# compiles tailwind css for prod & builds project
./tailwindcss -i css/index.css -o ./static/css/index.css --minify

# kills background processes on interrupt
trap 'kill $(jobs -p); exit 1' INT
wait