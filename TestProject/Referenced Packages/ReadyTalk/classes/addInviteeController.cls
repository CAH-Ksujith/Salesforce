/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class addInviteeController {
    @RemoteAction
    global static RT1.addInviteeController.searchResultWrapper searchLeadsContacts(String searchTerm, Integer leadPageNumber, Integer contactPageNumber, Boolean fetchLeads, Boolean fetchContacts) {
        return null;
    }
global class searchResult {
    global searchResult() {

    }
}
global class searchResultWrapper {
    global Integer contactPageNumber {
        get;
        set;
    }
    global Integer contactResultCount {
        get;
        set;
    }
    global Integer leadPageNumber {
        get;
        set;
    }
    global Integer leadResultCount {
        get;
        set;
    }
    global List<RT1.addInviteeController.searchResult> searchResults {
        get;
        set;
    }
    global searchResultWrapper() {

    }
}
}
