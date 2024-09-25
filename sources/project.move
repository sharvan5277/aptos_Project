module StudentIdentityVerification::Attendance {
    use std::signer;

    struct Student has key, store {
        id: u64,
        name: vector<u8>,
    }

    // Stores a student's identity on-chain
    public fun store_student(account: &signer, id: u64, name: vector<u8>) {
        let student = Student {
            id: id,
            name: name,
        };
        move_to(account, student);
    }

    // Verifies a student's identity by fetching stored data
    public fun verify_student(account: &signer) acquires Student {
        if (exists<Student>(signer::address_of(account))) {
            borrow_global<Student>(signer::address_of(account));
        }
    }
}

