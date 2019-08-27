Class User.samplexlsconversion Extends (%Persistent, %Populate) [ Owner = {_PUBLIC} ]
{

Property name As %String;

Property DOB As %Date;

Property address As %String;

Property PhoneNumber As %Numeric;

Property BloodGroup As %String(DISPLAYLIST = "", VALUELIST = "A A- B B- O");

ClassMethod ExtractXls()
{
               Set file=##class(%Library.File).%New("C:\Users\Ponnumani\Desktop\Ponnumani Tasks\file.csv")
               Do file.Open("WSN")
               Do file.WriteLine("""Name"",""Address"",""Phone Number"",""Blood Group"",""Date""")
               s id=""
               f {
                              set id=$Order(^User.samplexlsconversionD(id))
                              Quit:id=""
                              Set txt=^User.samplexlsconversionD(id)
                              Do file.WriteLine(""""_$List(txt,2)_""","_""""_$List(txt,3)_""","_""""_$List(txt,4)_""","_""""_$List(txt,5)_""","_""""_$List(txt,6)_"""")
               }
               d file.%Save()
               d file.Close()
               kill file
}