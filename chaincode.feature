 Given I have a bootstrapped fabric network of type solo using state-database couchdb with tls
    When an admin sets up a channel
    And an admin deploys chaincode at path "<path>" with args [""] with language "<language>"

    When a user invokes on the chaincode with args ["initDoc","docName1","date1","Sergey","Semen"]
    When a user invokes on the chaincode with args ["initDoc","docName2","date2","Sergey","Alex"]
    And I wait "3" seconds
    When a user queries on the chaincode with args ["readDoc","docName1"]
    Then a user receives a response containing "name":"docName1"
    And a user receives a response containing "date":"date1"
    And a user receives a response containing "owner":"Sergey"
    And a user receives a response containing "to":"Semen"

    When a user queries on the chaincode with args ["readDoc","docName2"]
    Then a user receives a response containing "name":"docName2"
    And a user receives a response containing "date":"date2"
    And a user receives a response containing "owner":"Sergey"
    And a user receives a response containing "to":"Alex"

    # queryDocByOwner
    When a user queries on the chaincode with args ["queryDocByOwner","Sergey"]
    Then a user receives a response containing "Key":"docName1"
    And a user receives a response containing "name":"docName1"
    And a user receives a response containing "date":"date1"
    And a user receives a response containing "owner":"Sergey"
    And a user receives a response containing "to":"Semen"
    And a user receives a response containing "Key":"docName2"
    And a user receives a response containing "name":"docName2"
    And a user receives a response containing "date":"date2"
    And a user receives a response containing "owner":"Sergey"
    And a user receives a response containing "to":"Alex"