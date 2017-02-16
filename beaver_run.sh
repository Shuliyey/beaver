dir_name=$(cd `dirname $0` && pwd)
params=$@
tag=latest
conf_path=${dir_name}/beaver.conf
data_path=${dir_name}/data
name=beaver
net=bridge
debug=false

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
      --conf_path)
        conf_path=${param_array[1]}
	;;
      --data_path)
        data_path=${param_array[1]}
	;;
      --name)
        name=${param_array[1]}
	;;
      --net)
	net=${param_array[1]}
	;;
      *)
        echo "unknown parameter: ${param_array[0]}"
        ;;
    esac
  fi
done

if [ "$debug" == "true" ]; then
  echo "tag=$tag, config_path=$config_path, data_path=$data_path, name=$name, net=$net"
fi

docker run -it -d --name=$name --restart=always \
  --net=$net \
  -v $conf_path:/opt/beaver/beaver.conf \
  -v $data_path:/data \
  shuliyey/beaver:$tag
