dir_name=$(cd `dirname $0` && pwd)
params=$@
tag=latest
debug=false
path=.

for param in $params; do

  if [ "$param" == "--debug" ]; then
    debug=true
    continue
  fi

  param_array=(${param//=/ })

  if [ "${param_array[1]}" != "" ]; then
    case ${param_array[0]} in
      --tag)
        tag=${param_array[1]}
        ;;
      --path)
        path=${param_array[1]}
        ;;
      *)
        echo "unknown parameter: ${param_array[0]}"
        ;;
    esac
  fi
done

if [ "$debug" == "true" ]; then
  echo "tag=$tag, path=$path"
fi

docker build -t shuliyey/beaver:$tag $path
