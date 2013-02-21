package com.example



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Test)
class TestTests {

    void testConstraints() {
        def existingBook = new Test(
                title: "Misery",
                author: "Stephen King")

        //existingBook.save();

        mockForConstraintsTests(Test, [existingBook])

        // validation should fail if both properties are null
        def test = new Test()

        assert !test.validate()
        assert "nullable" == test.errors["title"]
        assert "nullable" == test.errors["author"]

        // So let's demonstrate the unique and minSize constraints

        test = new Test(title: "Misery", author: "JK")
        assert !test.validate()
        assert "unique" == test.errors["title"]
        assert "minSize" == test.errors["author"]

        // Validation should pass!
        test = new Test(title: "The Shining", author: "Stephen King")
        assert test.validate()

        test.save()
    }
}
