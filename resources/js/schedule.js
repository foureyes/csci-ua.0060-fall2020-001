// handle jekyll site variables in data file
// (liquid variables in data files like csvs and yml are not processed)
function processSiteVars(config) {
	const re = /(site\.\w*)/g  
	const table = document.querySelector('table');

	console.log(table);
	const result = table.innerHTML.match(re);
	if(result) {
		for(const s of result) {
			const k = s.replace('site.', '');
			table.innerHTML = table.innerHTML.replace(new RegExp('{{ ' + s + ' }}', 'g'), config[k]);
		}
	}
}

// replace links to notebooks with links to:
// * html version of notebook
// * original notebook (notebook emoji)
// depends on nbconvert build step outside of jekyll
function createNotebookLinks() {
	const notebookLinks = document.querySelectorAll('td.topics ul > li > a');
	for (const a of notebookLinks) {
		if(a.href.endsWith('ipynb')) {
			console.log(a.href);
			a.textContent += ' ';
			const nb = document.createElement('a');
			nb.href = a.href;
			nb.textContent = '📓';
			a.parentNode.appendChild(nb);
      const pattern = /notebooks\/(\w*)/;
			a.href = a.href.replace(pattern,'notebooks\/$1\/html').replace('ipynb', 'html');
      console.log(a.href);
		}
	} 
}

