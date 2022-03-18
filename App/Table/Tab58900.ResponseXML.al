table 58900 "Response XML"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Response Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Status; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Response Text"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Response Code")
        {
            Clustered = true;
        }
    }
}
