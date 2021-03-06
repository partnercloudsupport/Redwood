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
  const Contact(fullName: 'Blaber, John', email: 'jblaber@tamdistrict.org', room: 'No Info on Room #', department: 'English', website: 'http://tamdistrict.org/blaber',),
  const Contact(fullName: 'Block, Britt', email: 'bblock@tamdistrict.org', room: 'No Info on Room #', department: 'Drama', website: 'http://redwood.org/block',),
  const Contact(fullName: 'Boles, Melissa', email: 'mboles@tamdistrict.org', room: 'No Info on Room #', department: 'Science', website: 'http://tamdistrict.org/boles',),
  const Contact(fullName: 'Brown, Ted', email: 'tbrown@tamdistrict.org', room: 'No Info on Room #', department: 'Social Studies', website: 'http://redwood.org/brown',),
  const Contact(fullName: 'Butkevich, Nickolai', email: 'nbutkevich@tamdistrict.org', room: 'No Info on Room #', department: 'Social Studies', website: 'https://www.tamdistrict.org/nbutkevich',),
  const Contact(fullName: 'Castro, Alison', email: 'acastro@tamdistrict.org', room: 'No Info on Room #', department: 'World Languages', website: 'http://tamdistrict.org/castro',),
  const Contact(fullName: 'Civano, Maria Fernanda', email: 'mcivano@tamdistrict.org', room: 'No Info on Room #', department: 'World Languages', website: 'http://tamdistrict.org/Civano',),
  const Contact(fullName: 'Cochrane, Kim', email: 'kcochrane@tamdistrict.org', room: 'No Info on Room #', department: 'Special Ed', website: 'No Website',),
  const Contact(fullName: 'Cohen, Mitch', email: 'mcohen@tamdistrict.org', room: 'No Info on Room #', department: 'Science', website: 'http://tamdistrict.org/cohen',),
  const Contact(fullName: 'Crabtree, Jessica', email: 'jcrabtree@tamdistrict.org', room: 'No Info on Room #', department: 'Mathematics', website: 'http://redwood.org/jcrabtree',),
  const Contact(fullName: 'Crabtree, William', email: 'wcrabtree@tamdistrict.org', room: '281', department: 'Applied Technology', website: 'No Website',),
  const Contact(fullName: 'Curtaz, Heather', email: 'hcurtaz@tamdistrict.org', room: 'No Info on Room #', department: 'Mathematics', website: 'No Website',),
  const Contact(fullName: 'Dahlman, Carolyn', email: 'cdahlman@tamdistrict.org', room: 'No Info on Room #', department: 'English', website: 'http://tamdistrict.org/dahlman',),
  const Contact(fullName: 'David, Jeffrey', email: 'jdavid@tamdistrict.org', room: 'No Info on Room #', department: 'Counseling', website: 'No Website',),
  const Contact(fullName: 'de Carion, Beth', email: 'bdecarion@tamdistrict.org', room: 'No Info on Room #', department: 'Special Ed', website: 'http://tamdistrict.org/decarion',),
  const Contact(fullName: 'DeAndreis, Kendall', email: 'kdeandreis@tamdistrict.org', room: 'No Info on Room #', department: 'English', website: 'No Website',),
  const Contact(fullName: 'Denardo, Derek', email: 'ddenardo@tamdistrict.org', room: 'No Info on Room #', department: 'Social Studies', website: 'http://redwood.org/denardo',),
  const Contact(fullName: 'Denton, Nikole', email: 'ndenton@tamdistrict.org', room: 'No Info on Room #', department: 'Special Ed', website: 'http://tamdistrict.org/denton',),
  const Contact(fullName: 'Diaz, Ernesto', email: 'ediaz@tamdistrict.org', room: 'No Info on Room #', department: 'Mathematics', website: 'http://tamdistrict.org/diaz',),
  const Contact(fullName: 'Dibley, Mike', email: 'mdibley@tamdistrict.org', room: 'No Info on Room #', department: 'Physical Education', website: 'No Website',),
  const Contact(fullName: 'Doherty, Wendy', email: 'wdoherty@tamdistrict.org', room: 'No Info on Room #', department: 'Science', website: 'http://tamdistrict.org/doran',),
  const Contact(fullName: 'Eller, Tom', email: 'teller@tamdistrict.org', room: 'No Info on Room #', department: 'Applied Technology', website: 'No Website',),
  const Contact(fullName: 'Esteb, Richard', email: 'resteb@tamdistrict.org', room: 'No Info on Room #', department: 'Applied Technology', website: 'http://redwood.org/esteb',),
  const Contact(fullName: 'Flores,Cathy', email: 'cflores@tamdistrict.org', room: 'No Info on Room #', department: 'English', website: 'No Website',),
  const Contact(fullName: 'Franklin, Alex', email: 'afranklin@tamdistrict.org', room: 'No Info on Room #', department: 'English', website: 'http://redwood.org/franklin',),
  const Contact(fullName: 'Garcia, Jamie', email: 'jgarcia@tamdistrict.org', room: 'No Info on Room #', department: 'Science', website: 'http://tamdistrict.org/garcia',),
  const Contact(fullName: 'Garcia, Pablo', email: 'pgarcia@tamdistrict.org', room: 'No Info on Room #', department: 'Mathematics', website: 'http://tamdistrict.org/pgarcia',),
  const Contact(fullName: 'Garcia, Tizoc', email: 'tgarcia@tamdistrict.org', room: 'No Info on Room #', department: 'World Languages', website: 'http://tamdistrict.org/tgarcia',),
  const Contact(fullName: 'Ghiraldini, Kathryn', email: 'kghiraldini@tamdistrict.org', room: 'No Info on Room #', department: 'English', website: 'No Website',),
  const Contact(fullName: 'Goldsmith, David', email: 'dgoldsmith@tamdistrict.org', room: '279', department: 'Applied Technology', website: 'http://redwood.org/goldsmith',),
  const Contact(fullName: 'Gonzalez, Joe', email: 'jgonzalez@tamdistrict.org', room: 'No Info on Room #', department: 'English', website: 'http://tamdistrict.org/jgonzalez',),
  const Contact(fullName: 'Greenberg, Corin', email: 'cgreenberg@tamdistrict.org', room: 'No Info on Room #', department: 'Social Studies', website: 'http://redwood.org/greenberg',),
  const Contact(fullName: 'Grubman, Roberta', email: 'rgrubman@tamdistrict.org', room: 'No Info on Room #', department: 'English', website: 'No Website',),
  const Contact(fullName: 'Gulden, Candace', email: 'cgulden@tamdistrict.org', room: 'No Info on Room #', department: 'Counseling', website: 'No Website',),
  const Contact(fullName: 'Harris, Jennifer', email: 'jharris@tamdistrict.org', room: 'No Info on Room #', department: 'Physical Education', website: 'No Website',),
  const Contact(fullName: 'Hart, Stephen', email: 'srhart@tamdistrict.org', room: 'No Info on Room #', department: 'Social Studies', website: 'No Website',),
  const Contact(fullName: 'Haver Castex, Stephannie', email: 'shavercastex@tamdistrict.org', room: 'No Info on Room #', department: 'English', website: 'http://tamdistrict.org/havercastex',),
  const Contact(fullName: 'Hettleman, Steve', email: 'shettleman@tamdistrict.org', room: 'No Info on Room #', department: 'English', website: 'No Website',),
  const Contact(fullName: 'Hirsch, Jon', email: 'jhirsch@tamdistrict.org', room: 'No Info on Room #', department: 'Social Studies', website: 'http://redwood.org/hirsch',),
  const Contact(fullName: 'Ippolito, Paul', email: 'pippolito@tamdistrict.org', room: 'No Info on Room #', department: 'Social Studies', website: 'http://redwood.org/ippolito',),
  const Contact(fullName: 'Jaime, Ann', email: 'ajaime@tamdistrict.org', room: 'No Info on Room #', department: 'Social Studies', website: 'http://tamdistrict.org/ajaime',),
  const Contact(fullName: 'Jordan, Aubrey', email: 'ajordan@tamdistrict.org', room: 'No Info on Room #', department: 'Science', website: 'http://tamdistrict.org/ajordan',),
  const Contact(fullName: 'Kartin, Mutlu', email: 'mkartin@tamdistrict.org', room: 'No Info on Room #', department: 'Science', website: 'http://tamdistrict.org/mkartin',),
  const Contact(fullName: 'Kelemen, Mike', email: 'mkelemen@tamdistrict.org', room: 'No Info on Room #', department: 'Social Studies', website: 'https://www.tamdistrict.org/kelemen',),
  const Contact(fullName: 'Kemp, Lisa', email: 'lkemp@tamdistrict.org', room: 'No Info on Room #', department: 'Social Studies', website: 'http://redwood.org/kemp',),
  const Contact(fullName: 'Kennedy, Lynne', email: 'lkennedy@tamdistrict.org', room: 'No Info on Room #', department: 'Counseling', website: 'No Website',),
  const Contact(fullName: 'Kestenbaum, Danielle', email: 'dKestenbaum@tamdistrict.org', room: 'No Info on Room #', department: 'English', website: 'http://tamdistrict.org/kestenbaum',),
  const Contact(fullName: 'Kittay, Allison', email: 'akittay@tamdistrict.org', room: 'No Info on Room #', department: 'Science', website: 'http://tamdistrict.org/kittay',),
  const Contact(fullName: 'Kittredge, Rebecca', email: 'rkittredge@tamdistrict.org', room: 'No Info on Room #', department: 'Mathematics', website: 'http://redwood.org/kittredge',),
  const Contact(fullName: 'Kniesche, Kelsey', email: 'kkniesche@tamdistrict.org', room: 'No Info on Room #', department: 'Science', website: 'http://tamdistrict.org/Kniesche',),
  const Contact(fullName: 'Kornfeld, Lindsey', email: 'lkornfeld@tamdistrict.org', room: 'No Info on Room #', department: 'Social Studies', website: 'http://tamdistrict.org/kornfeld',),
  const Contact(fullName: 'Kristal, Allison', email: 'akristal@tamdistrict.org', room: 'No Info on Room #', department: 'Mathematics', website: 'http://www.redwood.org/akristal',),
  const Contact(fullName: 'Kwan, Faye', email: 'fkwan@tamdistrict.org', room: 'No Info on Room #', department: 'Special Education', website: 'http://tamdistrict.org/kwan',),
  const Contact(fullName: 'LaTourrette, Emily', email: 'elatourrette@tamdistrict.org', room: 'No Info on Room #', department: 'English', website: 'http://tamdistrict.org/latourrette',),
  const Contact(fullName: 'Lauter, Liz', email: 'llauter@tamdistrict.org', room: 'No Info on Room #', department: 'Fine Arts', website: 'No Website',),
  const Contact(fullName: 'Leones, Laura', email: 'lleones@tamdistrict.org', room: '187', department: 'Special Ed', website: 'http://tamdistrict.org/lleones',),
  const Contact(fullName: 'Lloyd, Ryan', email: 'rlloyd@tamdistrict.org', room: 'No Info on Room #', department: 'Physical Education', website: 'No Website',),
  const Contact(fullName: 'Long, Heather', email: 'hlong@tamdistrict.org', room: 'No Info on Room #', department: 'Physical Education', website: 'No Website',),
  const Contact(fullName: 'Long, Whitney', email: 'wlong@tamdistrict.org', room: 'No Info on Room #', department: 'Special Ed', website: 'http://redwood.org/long',),
  const Contact(fullName: 'Lovelady, Skip', email: 'slovelady@tamdistrict.org', room: 'No Info on Room #', department: 'Science', website: 'http://tamdistrict.org/slovelady',),
  const Contact(fullName: 'Madden, Jennifer', email: 'jmadden@tamdistrict.org', room: 'No Info on Room #', department: 'English', website: 'No Website',),
  const Contact(fullName: 'Marcoux, Haley', email: 'hmarcoux@tamdistrict.org', room: 'No Info on Room #', department: 'Physical Education', website: 'No Website',),
  const Contact(fullName: 'Martone, Susanna', email: 'smartone@tamdistrict.org', room: 'No Info on Room #', department: 'Fine Arts', website: 'http://tamdistrict.org/smartone',),
  const Contact(fullName: 'Mastromonaco, Amy', email: 'amastromonaco@tamdistrict.org', room: 'No Info on Room #', department: 'Science', website: 'http://tamdistrict.org/mastro',),
  const Contact(fullName: 'Mattern, John', email: 'jmattern@tamdistrict.org', room: 'No Info on Room #', department: 'Music', website: 'http://redwood.org/mattern',),
  const Contact(fullName: 'Mauro, Samantha', email: 'smauro@tamdistrict.org', room: 'No Info on Room #', department: 'Mathematics', website: 'http://tamdistrict.org/Mauro',),
  const Contact(fullName: 'Maxwell, Susanne', email: 'smaxwell@tamdistrict.org', room: '521', department: 'Fine Arts', website: 'No Website',),
  const Contact(fullName: 'McCrea, Debbie', email: 'dmccrea@tamdistrict.org', room: 'No Info on Room #', department: 'World Languages', website: 'http://redwood.org/mccrea',),
  const Contact(fullName: 'McDaniel, Jim', email: 'jmcdaniel@tamdistrict.org', room: 'No Info on Room #', department: 'Social Studies', website: 'http://redwood.org/mcdaniel',),
  const Contact(fullName: 'Minhondo, David', email: 'dminhondo@tamdistrict.org', room: 'No Info on Room #', department: 'Social Studies', website: 'http://redwood.org/minhondo',),
  const Contact(fullName: 'Mortham, Nicole', email: 'nmortham@tamdistrict.org', room: 'No Info on Room #', department: 'Fine Arts', website: 'http://redwood.org/mortham',),
  const Contact(fullName: 'Murk, Karen', email: 'kmurk@tamdistrict.org', room: 'No Info on Room #', department: 'Mathematics', website: 'No Website',),
  const Contact(fullName: 'Nash, David', email: 'dnash@tamdistrict.org', room: 'No Info on Room #', department: 'Science', website: 'http://tamdistrict.org/dnash',),
  const Contact(fullName: 'Neal, Mary-Clare', email: 'mneal@tamdistrict.org', room: 'No Info on Room #', department: 'Mathematics', website: 'http://tamdistrict.org/mneal',),
  const Contact(fullName: 'Nelson, Byron', email: 'bnelson@tamdistrict.org', room: 'No Info on Room #', department: 'Physical Education', website: 'No Website',),
  const Contact(fullName: 'Norwood, Julie', email: 'jnorwood@tamdistrict.org', room: 'No Info on Room #', department: 'Mathematics', website: 'http://redwood.org/norwood',),
  const Contact(fullName: 'Parish, Peter', email: 'pparish@tamdistrict.org', room: '404', department: 'Drama', website: 'http://redwood.org/parish',),
  const Contact(fullName: 'Paulsen, Katie', email: 'kpaulsen@tamdistrict.org', room: 'No Info on Room #', department: 'Counseling', website: 'No Website',),
  const Contact(fullName: 'Peck, Marissa', email: 'mpeck@tamdistrict.org', room: 'No Info on Room #', department: 'Science', website: 'http://tamdistrict.org/peck',),
  const Contact(fullName: 'Peisch, Jessica', email: 'jpeisch@tamdistrict.org', room: 'No Info on Room #', department: 'Physical Education', website: 'No Website',),
  const Contact(fullName: 'Pepper, Natalie', email: 'npepper@tamdistrict.org', room: 'No Info on Room #', department: 'Special Ed', website: 'http://tamdistrict.org/npepper',),
  const Contact(fullName: 'Perani, Kristi', email: 'kperani@tamdistrict.org', room: 'No Info on Room #', department: 'Science', website: 'http://tamdistrict.org/perani',),
  const Contact(fullName: 'Perez, Adriana', email: 'aperez@tamdistrict.org', room: '162 (Libaray)', department: 'Librarian', website: 'No Website',),
  const Contact(fullName: 'Peter, Katie', email: 'kpeter@marin.k12.ca.us', room: 'No Info on Room #', department: 'Special Ed', website: 'No Website',),
  const Contact(fullName: 'Phillips, Marie-Noelle', email: 'mnphillips@tamdistrict.org', room: 'No Info on Room #', department: 'World Languages', website: 'http://tamdistrict.org/phillips',),
  const Contact(fullName: 'Plescia, Dave', email: 'dplescia@tamdistrict.org', room: 'No Info on Room #', department: 'Social Studies', website: 'http://tamdistrict.org/dplescia',),
  const Contact(fullName: 'Plescia, Nicolle', email: 'nplescia@tamdistrict.org', room: 'No Info on Room #', department: 'Social Studies and World Languages', website: 'http://redwood.org/nplescia',),
  const Contact(fullName: 'Rattet, Bernadette', email: 'brattet@tamdistrict.org', room: 'No Info on Room #', department: 'World Languages', website: 'http://redwood.org/rattet',),
  const Contact(fullName: 'Reyes, Alejandro', email: 'areyes@tamdistrict.org', room: 'No Info on Room #', department: 'Special Ed', website: 'http://tamdistrict.org/areyes',),
  const Contact(fullName: 'Rubio, Elise', email: 'erubio@tamdistrict.org', room: 'No Info on Room #', department: 'Science', website: 'http://tamdistrict.org/rubio',),
  const Contact(fullName: 'Ryan, Jeff', email: 'jryan@tamdistrict.org', room: 'No Info on Room #', department: 'English', website: 'No Website',),
  const Contact(fullName: 'Schneider, Erin', email: 'eschneider@tamdistrict.org', room: 'No Info on Room #', department: 'English', website: 'http://redwood.org/schneider',),
  const Contact(fullName: 'Schrick, Julianne', email: 'jschrick@tamdistrict.org', room: 'No Info on Room #', department: 'Mathematics', website: 'http://tamdistrict.org/jschrick',),
  const Contact(fullName: 'Scott, Ian', email: 'iscott@tamdistrict.org', room: 'No Info on Room #', department: 'Counseling', website: 'No Website',),
  const Contact(fullName: 'Seekamp, Karen', email: 'kseekamp@tamdistrict.org', room: 'No Info on Room #', department: 'Special Ed', website: 'http://tamdistrict.org/kseekamp',),
  const Contact(fullName: 'Silkworth, Christie', email: 'csilkworth@tamdistrict.org', room: 'No Info on Room #', department: 'Social Studies', website: 'http://tamdistrict.org/silkworth',),
  const Contact(fullName: 'Simon, Aaron', email: 'asimon@tamdistrict.org', room: 'No Info on Room #', department: 'Mathematics', website: 'http://redwood.org/simon',),
  const Contact(fullName: 'Sinkler, James', email: 'jsinkler@tamdistrict.org', room: 'No Info on Room #', department: 'Mathematics', website: 'http://tamdistrict.org/jsinkler',),
  const Contact(fullName: 'Sivertsen, Tom', email: 'tsivertsen@tamdistrict.org', room: 'No Info on Room #', department: 'English', website: 'No Website',),
  const Contact(fullName: 'Skieresz, Jessica', email: 'jskieresz@tamdistrict.org', room: 'No Info on Room #', department: 'Science', website: 'http://tamdistrict.org/Skieresz',),
  const Contact(fullName: 'Slattery, Katie', email: 'kslattery@tamdistrict.org', room: 'No Info on Room #', department: 'Science', website: 'http://tamdistrict.org/slattery',),
  const Contact(fullName: 'Stevens, Gregory', email: 'gstevens@tamdistrict.org', room: 'No Info on Room #', department: 'World Languages', website: 'http://redwood.org/stevens',),
  const Contact(fullName: 'Stewart, Joe', email: 'jstewart@tamdistrict.org', room: 'No Info on Room #', department: 'Science', website: 'http://tamdistrict.org/stewart',),
  const Contact(fullName: 'Sugi-Louie, Lovelyn', email: 'lsugi-louie@tamdistrict.org', room: 'No Info on Room #', department: 'Mathematics', website: 'http://redwood.org/sugi-louie',),
  const Contact(fullName: 'Summary, Mark', email: 'msummary@tamdistrict.org', room: 'No Info on Room #', department: 'Science', website: 'https://www.tamdistrict.org/msummary',),
  const Contact(fullName: 'Tepovich, Ann', email: 'atepovich@tamdistrict.org', room: 'No Info on Room #', department: 'Social Studies', website: 'http://redwood.org/tepovich',),
  const Contact(fullName: 'Vallejo, Connie', email: 'cvallejo@tamdistrict.org', room: 'No Info on Room #', department: 'World Languages', website: 'http://redwood.org/vallejo',),
  const Contact(fullName: 'Van Peursem, Todd', email: 'tvanpeursem@tamdistrict.org', room: 'No Info on Room #', department: 'World Languages', website: 'http://redwood.org/vanpeursem',),
  const Contact(fullName: 'Wall, Tami', email: 'twall@tamdistrict.org', room: 'No Info on Room #', department: 'Counseling', website: 'No Website',),
  const Contact(fullName: 'Watson, Taber', email: 'tnwatson@tamdistrict.org', room: 'No Info on Room #', department: 'Social Studies', website: 'http://tamdistrict.org/watson',),
  const Contact(fullName: 'Weller, Jon', email: 'jweller@tamdistrict.org', room: 'No Info on Room #', department: 'English', website: 'http://tamdistrict.org/weller',),
  const Contact(fullName: 'Winkler, Robert', email: 'rwinkler@tamdistrict.org', room: '305', department: 'English', website: 'No Website',),
  const Contact(fullName: 'Zeiher, Melissa', email: 'mzeiher@tamdistrict.org', room: 'No Info on Room #', department: 'World Languages', website: 'http://tamdistrict.org/mzeiher',),

];
