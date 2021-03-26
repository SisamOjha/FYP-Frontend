class Hospital {
  String imageUrl;
  String name;
  String address;
  

  Hospital({
    this.imageUrl,
    this.name,
    this.address,
  });
}

final List<Hospital> hospitals = [
  Hospital(
    imageUrl: 'assets/images/doc1.jpg',
    name: 'Roshan Acharya',
    address: 'Itahari-8,Sunsari',
 
  ),
  Hospital(
    imageUrl: 'assets/images/doc2.jpg',
    name: 'Sudha Agrawal',
    address: 'Itahari-1,Sunsari',
   
  ),
  Hospital(
    imageUrl: 'assets/images/doc3.jpg',
    name: 'Ghanyasam Jha',
    address: 'Itahari-9,Sunsari',
    
  ),
];
