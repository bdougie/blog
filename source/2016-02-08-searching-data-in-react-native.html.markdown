---
title: searching-data-in-react-native
date: 2016-02-08 01:01 UTC
tags: react-native, ios
category: react
layout: post-layout
---
# Searching Data in React Native

Learning how to do things in React Native requires a balance of using React Native 3rd party libraries, JavaScript libraries, and Native iOS code. 

![searching-gif](http://i.imgur.com/Bz5i5Mnm.gif)

Some things in React Native are pretty straight forward and enabling searching is exactly that. I did however have had explicitly choose a direction due to the multiple ways I could accomplish this.


I eventually chose to go with a regular JavaScript to solve this, with the addition of [lodash](https://lodash.com/).

For storing note data, I am using [Firebase](https://www.firebase.com)/ and the JavaScript [fetch](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API) to return notes in a JSON string. As soon as I call for the fetch in notes, I set the [ListView](https://facebook.github.io/react-native/docs/listview.html) Datasource and move on.

```

// Lib/Api.js

getNotes() {
 return fetch(jsonURL).then((res) => res.json())
 },

// Components/Notes.js

componentDidMount() {
  this.fetchData();
}

fetchData() {
  api.getNotes()
  .then((data) => {
    this.setState({
      dataSource: this.ds.cloneWithRows(data),
      isLoading: false,
      empty: false,
      rawData: data,
    });
  })
  .catch((error) => {
    console.log(error)
    this.setState({
      empty: true,
      isLoading: false,
    });
  });
}

```

The [componentDidMount](https://facebook.github.io/react/docs/component-specs.html) function is part of the React Component lifecycle api and runs after initialization of the component, any function within it’s closures will run.

Searching is just as easy using basic JavaScript, as soon as I type in the search box, the `onChange` function takes over and starts the filtering of notes presented.

```

<TextInput
 style={styles.searchBar}
 value={this.state.searchText}
 onChange={this.setSearchText.bind(this)}
 placeholder=”Search” />

```

My `setSearchText` captures the native JavaScript event as text and proceeds to set the searchText state and then then filters the notes displayed based on the original input saved in state. 

```

setSearchText(event) {
 let searchText = event.nativeEvent.text;
 this.setState({searchText});

 base.fetch(‘notes’, {
   context: this,
   asArray: true,
   then(data){
     let filteredData = this.filterNotes(searchText, data);
     this.setState({
       dataSource: this.ds.cloneWithRows(filteredData),
       rawData: data,
     });
   }
 });
}

filterNotes(searchText, notes) {
  let text = searchText.toLowerCase();

  return filter(notes, (n) => {
    let note = n.body.toLowerCase();
    return note.search(text) !== -1;
  });
}

```

I originally was going to use a pre packaged [react-native-search](https://www.npmjs.com/package/react-native-search) library, but opted to recreate that same library it for my own solution.

Finally my css is also pretty straight forward and an attempt to recreate the look of the Native iOS search bar. 

```
searchBar: {
  paddingLeft: 30,
  fontSize: 22,
  height: 10,
  flex: .1,
  borderWidth: 9,
  borderColor: ‘#E4E4E4’,
},

```

Overall this was a pretty simple task to accomplish and the beauty of this is that it could easily be written into it’s own component if I feel it needs to be abstracted.

![searching-gif](http://i.imgur.com/Bz5i5Mn.gif)
