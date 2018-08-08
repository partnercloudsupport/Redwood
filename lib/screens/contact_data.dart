class Contact {
  final String fullName;
  final String email;
  final String room;
  final String department;
  final String website;

  const Contact({this.fullName, this.email, this.room, this.department, this.website});
}

const List<Contact> kContacts = const <Contact>[
  const Contact(fullName: 'Allan, Fiona', email: 'fallan@tamdistrict.org', room: 'No Info on Room #', department: 'English', website: 'http://redwood.org/fallan',),
  const Contact(fullName: 'Alsina, Anna', email: 'aalsina@tamdistrict.org', room: 'No Info on Room #', department: 'World Languages', website: 'http://tamdistrict.org/Alsina',),
  const Contact(fullName: 'Bartone, Lauren', email: 'lbartone@tamdistrict.org', room: 'No Info on Room #', department: 'Fine Arts', website: 'http://www.redwoodvisualarts.org',),
  const Contact(fullName: 'Baxt, Amy', email: 'abaxt@tamdistrict.org', room: 'No Info on Room #', department: 'Drama', website: 'http://tamdistrict.org/baxt',),
  const Contact(fullName: 'Benjamin, Amy', email: 'abenjamin@tamdistrict.org', room: 'No Info on Room #', department: 'Mathematics', website: 'http://tamdistrict.org/Benjamin',),
  const Contact(fullName: 'Berkowitz, Erik', email: 'eberkowitz@tamdistrict.org', room: 'No Info on Room #', department: 'Drama', website: 'No Website',),
];
