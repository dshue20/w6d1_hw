export const fetchSearchGiphys = searchTerm => {
    const api = 'HQIazW8UzTQr1Rb04sFC9ucP7XSzS1Yx';
    return $.ajax({
        method: 'GET',
        url: `http://api.giphy.com/v1/gifs/search?q=${searchTerm}&api_key=${api}&limit=2`
    });
};