#!/usr/bin/env python

class drydocker():
    def __init__(self):
        import sys
        from optparse import OptionParser
        parser = OptionParser()
        parser.add_option("-n", "--name", action="store", dest="name", help="Use the specified docker name for testing")
        parser.add_option("-t", "--tests", action="store", dest="test", help="Test(s) to run this can be an individual test or a test suite")
        (options, args) = parser.parse_args()
        if options.test is None:
            self.usage(sys.argv[0])
        elif options.name is None:
            print("Here")
            print("No image name specified, pulling a list of installed dockers")
            self.imagelist()
            sys.exit()
        else:
            list=sys.argv[1:]
            self.testrunner(list)

    def usage(self,arg):
        filename = arg.split("/")
        print("Incorrect Usage! drydock requires arguments")
        print("Please run this again with the -h option for a full list of arguments:")
        print(filename[1] + "-n nameofdocker -t [--tests] test1 test2 test3 etc...")

    def testrunner(self,arg):
        import subprocess
        for index, item in enumerate(arg):
            if "-n" in item:
                name=(arg[index+1])
            if "-t" in item:
                element=(index+1)    
        tests=arg[element:]
        for item in tests:
            docklist = subprocess.call(["docker", "run", "-v=/tests/robot/cases/:tests " + name + " --outputdir=/tests/results", "/tests/"+ item + ".txt"])
        print("Tests are done")
        

    def imagelist(self):
        import subprocess
        docklist = subprocess.call(["docker", "images", "--filter", "\"dangling=false\""])

if __name__ == "__main__":
    drydock = drydocker()
