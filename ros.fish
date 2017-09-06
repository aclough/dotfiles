
function _rossed
  if test (uname) = "Darwin" -o (uname) = "FreeBSD"
      sed -E $argv
  else
      sed -r $argv
  end
end

function _rosfind
  if  test (uname) = "Darwin" -o (uanme) = "FreeBSD"
    # BSD find needs -E for extended regexp
    find -E $argv
  else
    find $argv
  end
end

# _ros_location_find
# Takes a name of a ros location and returns it's path
function _ros_location_find
    set -l homedir (echo $HOME | sed -e "s/\//\t\//g" -e "s/\t/\\\/g")
    set -l ROS_LOCATION_KEYS_ARR (echo $ROS_LOCATIONS | _rossed -e 's/([^:=]*)=([^:=]*)(:*[^=])*(:|$)/\1 /g')
    set -l ROS_LOCATIONS_ARR (echo $ROS_LOCATIONS | _rossed -e 's/([^:=]*)=([^:=]*)(:*[^=])*(:|$)/\2 /g' -e "s/~/{$homedir}/g")
    for key in $ROS_LOCATION_KEYS_ARR
        if test $argv[1] = $key
            echo $key
            return 0
        end
    end

    if test $argv[1] = log
        echo (roslaunch-logs)
        return 0
    else if test $argv[1] = test_results
        echo (rosrun rosunit test_results_dir.py)
        return 0
    end

    set -l loc (set -x ROS_CACHE_TIMEOUT -1.0; rospack find $argv[1] 2> /dev/null)
    if test $status != 0
        set loc (set -x ROS_CACHE_TIMEOUT -1.0; rosstack find $argv[1] 2> /dev/null)
        if test $status != 0
            return 1
        end
        echo $loc
        return 0
    end
    echo $loc
    return 0
end

function _ros_list_locations
    set -l ROS_LOCATION_KEYS (echo $ROS_LOCATIONS | _rossed -e 's/([^:=]*)=([^:=]*)(:*[^=])*(:|$)/\1 /g')
    set -l packages (set -x ROS_CACHE_TIMEOUT -1.0; rospack list-names)
    set -l stacks (set -x ROS_CACHE_TIMEOUT -1.0; rosstack list-names)
    echo $packages $stacks log test_results $ROS_LOCATION_KEYS | tr ' ' '\n'
    return 0
end

function _ros_package_find
    set -l loc (set -x ROS_CACHE_TIMEOUT -1.0; rospack find $1 2> /dev/null)
    if test $status != 0
        return 1
    end
    echo $loc
    return 0
end

function _ros_list_packages
    set -l packages (set -x ROS_CACHE_TIMEOUT -1.0; rospack list-names)
    echo $packages | tr ' ' '\n'
    return 0
end

function _ros_list_stacks
    set -l stacks (set -x ROS_CACHE_TIMEOUT -1.0; rosstack list-names)
    echo $stacks | tr ' ' '\n'
    return 0
end

# takes as argument either just a package-path or just a pkgname
# returns 0 for no argument or if package (+ path) exist, 1 else
# on success with arguments returns [name, abspath, basepath, remainder]
function _ros_decode_path
    if test -z $argv[1]
        return 0
    end

    set -l rosname (echo $argv[1] | sed -n 's/\([^/]\+\).*/\1/p')

    if not test -z $rosname
        set remainder (echo $argv[1] | sed -n "s/$rosname"'\(.*\)/\1/p')
    else
        set rosname $argv[1]
        if test (count $argv) != "2" -o $argv[2] != "forceeval"
           echo $rosname
           return 1
        end
    end

    set -l rosdir (_ros_location_find $rosname)
    if test $status != "0"
        echo $rosname
        return 1
    end
    set -l reldir (echo $remainder | sed -n 's/\(.*\/\)[^/]*/\1/p')
    set -l last (echo $remainder | sed -n 's/.*\/\([^/]*\)/\1/p')

    if test -z $reldir
        set reldir /
    end

    set rosvals {$rosname} {$rosdir} {$reldir} {$last}
    echo {$rosdir}{$remainder}
    return 0
end

function rospython
  if test -z $argv
    python -i -c "import roslib; roslib.load_manifest('$1')"
    return 0
  end
  if test (count $argv) = 1
    if test $argv[1] = "--help"
      echo -e "usage: rospython [package] \n\nRun python loading package manifest first."
      return 0
    end
  end
  if test -f ./manifest.xml
    set pkgname (basename (pwd))
    python -i -c "import roslib; roslib.load_manifest($pkgname)"
  else
    python
  end
end

function roscd
  if test -z $argv[1]
    if test -n $ROS_WORKSPACE
      cd $ROS_WORKSPACE
      return 0
    end
    if test -n $CMAKE_PREFIX_PATH[1]
      for ws in $CMAKE_PREFIX_PATH
        ls $ws/.catkin
        if test -f $ws/.catkin
          cd $ws
          return 0
        end
      end
    end
    echo -e "Neither ROS_WORKSPACE is set nor a catkin workspace is listed in CMAKE_PREFIX_PATH.  Please set ROS_WORKSPACE or source a catkin workspace to use roscd with no arguments."
    return 1
  end

  if test $argv[1] = "--help"
    echo -e "usage: roscd package\n\nJump to target package."
    return 0
  end

  set -l rospath (_ros_decode_path $argv[1] forceeval)
  if test -z $rospath
    if test -z $ROS_WORKSPACE
      echo -e "No ROS_WORKSPACE set.  Please set ROS_WORKSPACE to use roscd with no arguments."
      return 1
    end
    cd $ROS_WORKSPACE
    return 0
  else
    cd $rospath
    return 0
  end
end

function _is_integer
  not test -z (expr $argv[1] - $argv[1] 2>/dev/null)
  return $status
end

function rosd
    if test (count $argv) != 0
      if test $argv[1] = "--help"
        echo -e "usage: rosd\n\nDisplays the list of currently remembered directories with indexes."
        return 0
      end
    end
    set count 0
    for items in (dirs | sed -e 's/  /\n/g')
        echo $count $items;
        set count (expr $count + 1)
    end
end

function rospd
    if test (count $argv) != 0
      if test $argv[1] = "--help"
        echo -e "usage: rospd\n\nLike pushd, also accepts indexes from rosd."
        return 0
      end
    else
      echo -e "usage: rospd\n\nLike pushd, also accepts indexes from rosd."
      return 0
    end
    set -l rospath (_ros_decode_path $argv[1] forceeval)
    pushd $rospath > /dev/null
    rosd
end

function rosls
    if test (count $argv) != 0
      if test $argv[1] = "--help"
        echo -e "usage: rosls [package]\n\nLists contents of a package directory."
        return 0
      end
    else
      echo -e "usage: rosls [package]\n\nLists contents of a package directory."
      return 0
    end
    set -l rospath (_ros_decode_path $argv[1] forceeval)
    ls $rospath
end

# sets arg as return value
function _roscmd
    set -l opt
    if test -n $CMAKE_PREFIX_PATH
        set -l catkin_package_libexec_dir (catkin_find --without-underlays --libexec $argv[1] 2> /dev/null)
    end
    set -l pkgdir (_ros_package_find $argv[1])
    if test -z $catkin_package_libexec_dir -a -z $pkgdir
        echo "Couldn't find package $argv[1]"
        return 1
    end
    set -l exepath (find -L $catkin_package_libexec_dir $pkgdir -name $2 -type f ! -regex .*/[.].* ! -regex .*$pkgdir\/build\/.* | uniq)
    if test (count $execpath) = "0"
        echo "That file does not exist in that package."
        return 1
    else if test (expr (count $exepath) '>' 1) = "1"
        echo "You have chosen a non-unique filename, please pick one of the following:"
        for i in (seq (count $execpath))
            echo $i") " $execpath[i]
        end
        read choice
        set -l opt $execpath[$choice]
    else
        set -l opt $exepath[1]
    end
    arg=$opt
end

function rosed
    set -l arg
    if test (count $argv) = 0
       echo -e "usage: rossed [package] [file]\n\nEdit a file within a package."
       return 0
    end
    if test $argv[1] = "--help"
       echo -e "usage: rossed [package] [file]\n\nEdit a file within a package."
       return 0
    end
    _roscmd $argv[1]
    if test -n $arg
        if test -z $EDITOR
            vi $arg
        else
            $EDITOR $arg
        end
    end
end

function roscp
    set -l arg
    if test  (count $argv) != "3"
        echo -e "usage: roscp package filename target\n\nCopy a file from a package to target location."
        return 0
    end
    _roscmd $argv[1] $argv[2]
    cp $arg $argv[3]
end

function _roscomplete
  _ros_list_locations
  _ros_list_stacks
end

function _roscomplete_sub_dir
    set -l wd $PWD
    set -l roslocs (_ros_list_locations)
    set -l arg (commandline -ct)
    set -g rosvals
    set -l path (_ros_decode_path $arg)
    if test -z $rosvals[1]
        # Not a full ROS location
        _ros_list_locations
    else
        # The first section is a full ROS location, so we complete from it's subdirs
        find -L $rosvals[2]$rosvals[3] -maxdepth 1 -mindepth 1 -type d ! -regex ".*/[.].*" -print0 | tr '\000' '\n' | sed -e "s/.*\/\(.*\)/$rosvals[1]\/\1/g"
    end
end

function _roscomplete_rosmake
    _roscomplete
    set options --test-only --all --mark-installed --unmark-installed --robust --build-everything --specified-only --buildtest --buildtest1 --output --pre-clean --bootstrap --disable-logging --target --pjobs= --threads --profile --skip-blacklist --status-rate
    for i in $options
         echo $i
    end
end

function _roscomplete_search_dir
    set -l command (commandline -o)
    if test (count $command) = 1
      echo "1" >> ~/output.txt
      _ros_list_packages
    end
    if test (count $command) = 2
      echo "2" >> ~/output.txt
      _ros_list_packages
    end
    if test (count $command) = 3
      echo "3" >> ~/output.txt
      find (_ros_location_find $command[1]) $arg -printf "%f\n"
    end
end

function _roscomplete_rosrun
    _roscomplete_search_dir '-type f -perm +111'
end

function _roscomplete_file
    _roscomplete_search_dir '-type f ! -regex .*[.][oa]$'
end

function _roscomplete_launch
  if test -z (commandline -ct | grep i-)
    set options --files --args --nodes --find-node --child --local --screen --server_uri --run_id --wait --port --core --pid --dump-params
    for i in $options
         echo $i
    end
  else
    _roscomplete_search_dir '-type f -regex \'.*\.launch$\' -o -type f -regex \'.*\.test$\''
  end
end

complete -x -c roscd -a '(_roscomplete_sub_dir)'
complete -c roscd -l help --description "prints command info"
complete -c rospd -a '(_roscomplete_sub_dir)'
complete -c rosls -a '(_roscomplete_sub_dir)'
complete -c rosls -l help --description "prints command info"
complete -x -c rosmake -a '(_roscomplete_rosmake)'
complete -x -c rosclean -a 'check purge'
complete -x -c rosrun -a '(_roscomplete_rosrun)'
complete -x -c roslaunch -a '(_roscomplete_launch)'
complete -x -c rosed -a '(_roscomplete_file)'
complete -c rosed -l help --description "prints command info"
complete -x -c roscp -a '(_roscomplete_file)'et -x TEST works
complete -c roscp -l help --description "prints command info"
