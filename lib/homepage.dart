import 'package:contact_app/contacts.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget{
  const HomePage({Key? key}): super(key:key);
  @override
  State<HomePage> createState()=> _HomePageState() ;

}

class _HomePageState extends State<HomePage>{
  TextEditingController nameController = TextEditingController(); 
  TextEditingController contactsController= TextEditingController(); 
  List<Contacts> contacts = List.empty(growable: true);

  int selectedIndex = -2;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, 
        title: const Text('Your Contacts List'),), 
      body: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children:[
             SizedBox(height:12), 
            TextField(
              controller: nameController,
              decoration:  InputDecoration(
                hintText: 'Name of the person',
                    border:OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),


              )
              ),
            ),
            SizedBox(height:12),
            TextField(
              controller: contactsController,
              keyboardType: TextInputType.number,
              maxLength: 10,
              decoration: InputDecoration(
                hintText: 'Contact number of the person',
                    border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
              )
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      //
                      String name = nameController.text.trim();
                      String contact = contactsController.text.trim();
                      if (name.isNotEmpty && contact.isNotEmpty) {
                        setState(() {
                          nameController.text = '';
                          contactsController.text = '';
                          contacts.add(Contacts(name: name, contact: contact));
                        });
                      }
                      //
                    },
                    child: Text('Save the contact')),
                ElevatedButton(
                    onPressed: () {
                      //
                      String name = nameController.text.trim();
                      String contact = contactsController.text.trim();
                      if (name.isNotEmpty && contact.isNotEmpty) {
                        setState(() {
                          nameController.text = '';
                          contactsController.text = '';
                          contacts[selectedIndex].name = name;
                          contacts[selectedIndex].contact = contact;
                          selectedIndex = -2;
                        });
                      }
                      //
                    },
                    child: Text('Update the contact information')),
              ],
            ),
             SizedBox(height: 10),
            contacts.isEmpty
                ?  Text(
              'No Contact saved yet.',
              style: TextStyle(fontSize: 22),
            )
                : Expanded(
              child:  ListView.builder(
                itemCount: contacts.length,itemBuilder:(context, index) => getRow(index) ,
        )
       )];
  },


  Widget getRow(int index) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor:
          index % 2 == 0 ? Colors.blueAccent : Colors.black26,
          foregroundColor: Colors.white,
          child: Text(
            contacts[index].name[0],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              contacts[index].name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(contacts[index].contact),
          ],
        ),
        trailing: SizedBox(
          width: 50,
          child: Row(
            children: [
              InkWell(
                  onTap: () {
                    //
                    nameController.text = contacts[index].name;
                    contactsController.text = contacts[index].contact;
                    setState(() {
                      selectedIndex = index;
                    });
                    //
                  },
                  child: const Icon(Icons.edit)),
              InkWell(
                  onTap: (() {
                    //
                    setState(() {
                      contacts.removeAt(index);
                    });
                    //
                  }),
                  child: const Icon(Icons.delete)),
            ],
          ),
        ),
      ),
    );
  }
}