#!/bin/sh
#
# OpenBox menu tool for amountd
# v0.5

PREFIX=/media
MOUNTABLE=/tmp/.amountd/mountable

doCmd () {
	local mcmd
	case "${1}" in
	mount)
		case "${2}" in
		msdosfs)
			mcmd="mount_msdosfs"
			if [ -n "${5}" ]; then
				mcmd="${mcmd} -u ${5}"
			fi
			;;
		ufs)
			mcmd="mount -t ufs"
			;;
		*)
			return 1
			;;
		esac
		mkdir -p ${4} && ${mcmd} ${3} ${4}
		;;
	umount)	
		umount ${3} && rmdir ${4}
		;;
	esac
	return $?
}

if [ "${1}" = "doCmd" ]; then
	shift
	doCmd "$@"
	exit $?
fi

if [ -n "${1}" -a -n "${2}" -a -n "${3}" ]; then
	case "${1}" in
	mount|umount) ;;
	*)
		exit 1
		;;
	esac
	cmd=${1}
	cdev=${2}
	cuser=${3}
	if [ ! -r ${MOUNTABLE} ]; then
		exit 1
	fi
else
	echo "<openbox_pipe_menu>"
	if [ ! -r ${MOUNTABLE} ]; then
		echo '<item label="Unable to read mountable"/>'
		echo "</openbox_pipe_menu>"
		exit 1
	fi
fi

while read dev fs label <&3; do
	if [ -z "${label}" ]; then
		provider=/dev/${dev}
		mpoint=${PREFIX}/${dev}
		oblabel="${dev} ${fs}"
	else
		provider="/dev/${fs}/${label}"
		mpoint=${PREFIX}/${label}
		oblabel="${dev} ${fs}/${label}"
	fi
	mstat=$(mount |grep -E "^/dev/(${dev}|${fs}/${label}) on")
	if [ $? -eq 0 ]; then
		op=umount
		set -- ${mstat}
		provider="${1}"
		mpoint="${3}"
	else
		op=mount
	fi
	if [ -n "${cdev}" ]; then
		if [ "${cdev}" = "${dev}" -a "${op}" = "${cmd}" ]; then
			sudo ${0} doCmd ${op} ${fs} ${provider} ${mpoint} ${cuser}
			if [ $? -eq 0 ]; then
				xmessage -nearmouse -timeout 1 success
			else
				xmessage -nearmouse -timeout 5 fail
			fi
			exit 0
		fi
		continue
	fi
	cat <<_EOF
	<item label="${op} ${oblabel}">
		<action name="Execute">
			<command>${0} ${op} ${dev} ${USER}</command>
		</action>
	</item>
_EOF
done 3<${MOUNTABLE}

echo "</openbox_pipe_menu>"
