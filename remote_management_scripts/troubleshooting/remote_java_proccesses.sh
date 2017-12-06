cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source ../set_env.sh
LOCATOR_1=$(sed -n '1p' < locators.txt)
IP="$(echo $LOCATOR_1 | cut -d ' ' -f 1)"
echo "+++++++++++++++++++++++++++++++"
echo "List of Kill Remote Proccesses?"
echo "+++++++++++++++++++++++++++++++"
echo "1: List Remote Java Processes"
echo "2: Kill Remote Java Processes"
echo "-------------------------------"
read option

if [[ ("$option" -eq "1") ]]; then
  echo "---------------------------------------"
  echo " Listing Java Processes On The Locators"
  echo "---------------------------------------"
  while read IP; do
      {
        IP="$(echo $IP | cut -d ' ' -f 1)"
        echo "Processes On $IP:"
        ssh -i $LOCAL_AWS_PEM_LOCATION ubuntu@$IP ps -ef | grep java
      } < /dev/null
  done < locators.txt

  # List files on the Server
  echo "--------------------------------------"
  echo " Listing Java Processes On The Servers"
  echo "--------------------------------------"
  while read IP; do
    {
      IP="$(echo $IP | cut -d ' ' -f 1)"
      echo "Processes On $IP:"
      ssh -i $LOCAL_AWS_PEM_LOCATION ubuntu@$IP ps -ef | grep java
    } < /dev/null
  done < servers.txt
fi

if [[ ("$option" -eq "2") ]]; then
  echo "--------------------------------------"
  echo "Killing Java On The Locators:"
  echo "--------------------------------------"
  while read IP; do
      {
        IP="$(echo $IP | cut -d ' ' -f 1)"
        ssh -i $LOCAL_AWS_PEM_LOCATION ubuntu@$IP pkill java
      } < /dev/null
      echo "$IP Done"
  done < locators.txt

  # List files on the Server
  echo "--------------------------------------"
  echo "Killing Java On The Server:"
  echo "--------------------------------------"
  while read IP; do
    {
      IP="$(echo $IP | cut -d ' ' -f 1)"
      ssh -i $LOCAL_AWS_PEM_LOCATION ubuntu@$IP pkill java
    } < /dev/null
    echo "$IP Done"
  done < servers.txt
fi
