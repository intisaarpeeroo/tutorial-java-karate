package examples.users;

import com.intuit.karate.junit5.Karate;

class DummyUsersRunner {

    @Karate.Test
    Karate testDummyUsers() {
        return Karate.run("DummyUsers").relativeTo(getClass());
    }    

}
