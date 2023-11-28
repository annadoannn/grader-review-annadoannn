CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

if [[ -f student-submission/ListExamples.java ]]
then 
    #echo "you exist"
    cp TestListExamples.java ./student-submission
    javac -cp $CPATH *.java
    cp -r student-submission/*.java grading-area
    if [ $? -eq 0 ]
    then
        echo "All tests passed"
        echo Your grade is 100%
        exit 0
    fi
else 
    echo "wrong file(s) submitted"
    exit
fi

# Then, add here code to compile and run, and do any post-processing of the
# tests
