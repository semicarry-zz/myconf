import sys
import json
import datetime
import time
"""A programme to calc lunch for jx
"""

class Lunch:
    def __init__(self, filename="lunch.json"):
        "store lunch json file"
        f = open( filename, "r")
        self.lunch = json.load(f)
        f.close()
        #if __debug__ == True:
            #print "parse json file %s succeed"%filename

    def __save( self, filename="lunch.json"):
        f = open( filename, "w")
        f.write( json.dumps(self.lunch, sort_keys=True, indent=4))
        f.close()

    def dep( self, argv=None):
        "dep money to bank"
        name = "all"
        #if __debug__ == True:
            #print argv
        try:
            money = float(argv.pop())
        except Exception, e:
            print e
            help()
        if len(argv) >= 1:
            name = argv.pop()
        if name == "all":
            for elem in self.lunch["persons"]:
                self.dep( [elem, money])
            self.balance()
        else:
            self.lunch[name]["balance"] += money
            self.lunch[name]["deps"].append({ time.strftime("%m%d-%H%M"):money})
            print "dep %.2f to %s succeed, now balance is [%.2f]"%( money, name, self.lunch[name]["balance"])

    def eat( self, argv=None):
        "cost money"
        name = "all"
        try:
            money = float(argv.pop())
        except Exception, e:
            print e
            help()

        if len(argv) >= 1:
            name = argv.pop()

        if name == "all":
            for elem in self.lunch["persons"]:
                self.eat( [elem, money])
            self.balance()
        else:
            self.lunch[name]["balance"] -= money*self.lunch["ratio"]
            self.lunch[name]["lunches"].append({ time.strftime("%m%d-%H%M"):money})
            print "%s eat %.2f succeed, now balance is [%.2f]."%( name, money, self.lunch[name]["balance"])

        if len(argv) >= 1:
            for elem in argv:
                self.eat( [elem, money])
            self.balance()

    def balance( self, argv=None):
        "show balance"
        totalbalance = 0;
        for elem in self.lunch["persons"]:
            totalbalance += self.lunch[elem]["balance"]
            print "%s's balance is %.2f."%( elem, self.lunch[elem]["balance"])
        print "Total balance is [%.2f].Card balance is [%.2f]."%(totalbalance, totalbalance/self.lunch["ratio"])

    def rollback( self, argv=None):
        pass

    def backup( self, argv=None):
        """docstring for backup"""
        pass

    def adduser( self, argv=None):
        """docstring for adduser"""
        pass

    def deluser( self, argv=None):
        """docstring for deluser"""
        pass


    def exit( self, retcode):
        if retcode == 0:    
            self.__save()
        sys.exit()
        
def help():
    "show help menu"
    print "Usage: lunch.py [COMMANDS] [ARGUMENTS]"
    print "Commands"
    print "     --balance           Show balance"
    print "     --add person        Add new person"
    print "     --dep person money  Dep money to someone"
    print "     --eat person money  Spend money to eat"
    exit(1)

def main():
    """main for lunch"""
    if len(sys.argv) < 2 :
        help()
        exit(1)
    lunch = Lunch()
    action = getattr( lunch, sys.argv[1], None)
    if action == None:
        help()
        lunch.exit(1)
    action(sys.argv[2:])
    #print json.dumps(lunch.lunch, sort_keys=True, indent=4)
    lunch.exit(0)


if __name__ == "__main__":
    main()
