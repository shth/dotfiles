(function(){function append(name,method){if(!String.prototype[name])String.prototype[name]=method}append("trim",function(){return this.replace(/(^\s+|\s+$)/g,"")});append("ltrim",function(){return this.replace(/^\s*/g,"")});append("rtrim",function(){return this.replace(/\s*$/g,"")});append("collapseSpaces",function(){return this.trim().replace(/\s{2,}/g," ").replace(/{(Keyword):\s*(.*?)\s*}/gi,"{$1:$2}")});append("format",function(substrings){var subRegExp=/(?:%(\d+))/mg,currPos=0,r=[];do{var match=subRegExp.exec(this);if(match&&match[1]){if(match.index>currPos)r.push(this.substring(currPos,match.index));r.push(substrings[parseInt(match[1])]);currPos=subRegExp.lastIndex}}while(match);if(currPos<this.length)r.push(this.substring(currPos,this.length));return r.join("")});append("remove",function(start,length){var s='';if(start>0)s=this.substring(0,start);if(start+length<this.length)s+=this.substring(start+length,this.length);return s});append("reverse",function(){if(!this)return'';var a=(this+'').split('');a.reverse();return a.join('')});append("repeat",function(count,separator){var t=this,s="";while(--count+1>0)s+=(separator&&count!=0)?t+separator:t;return s});append("pad",function(length,ch,direction){length=length||30;direction=direction||0;ch=ch||' ';var t=this;while(t.length<length)t=(direction==1)?t+=ch:ch+t;return t});append("capitalize",function(){var w=this.split(' ');for(var i=0;i<w.length;i++)w[i]=w[i].charAt(0).toUpperCase()+w[i].substring(1).toLowerCase();return w.join(" ")});append("camelize",function(){return this.replace(/[-_]([a-z])/ig,function(z,b){return b.toUpperCase()})});append("truncate",function(length,suffix){length=length||50;suffix=suffix===undefined?"...":suffix;return this.length>length?this.slice(0,length-suffix.length)+suffix:this});append("stripTags",function(){return this.replace(/<\/?[^>]+>/gi,'')})})();