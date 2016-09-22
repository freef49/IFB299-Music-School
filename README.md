# IFB 299

## Sprint and release Plan
The spring and release plan in developement can be found here:
https://docs.google.com/document/d/13GtgIFlC-mK1TnwiQaYQo_29Fug1yfPcqBq6GHSP12I/

Website hosted at https://ifb299-mikamusic-fm.herokuapp.com/



## Pushing repository

There are three git repositories allocated in this cloud nine! Please unless you are brad,
only use the github repository!

$ git push github master 

The above command will push to the github repository! The following command is for brad's private bitbucket.
Where I will store non relivant tutorials.

$ git push bitbucket master

Best Practice: 

Create Branch for task working on:

$ git checkout -b "'branch Name'"


Work on branch for intended task, Making sure to commit each change:

$git commit -am "'Changes Made'"


Once Task is complete, commit and then check to see if there are clashing changes between your branch and master.
If there are not clashes, go back to master and push additions:

$git checkout master

$git push github master


During developement of task, website can be checked using cloud 9 or at the very end:
$git push master heroku

or to test just your branch:

$git push 'branch name' heroku


Finally, at the end of each task. Record Hours spent and post hours into Slack (Hours Channel)

$ rails server -b $IP -p $PORT


