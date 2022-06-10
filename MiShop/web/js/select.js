var dls = document.querySelectorAll('dl:not(.select)');
var selected=document.querySelector('.select');

for (var i = 0; i < dls.length; i++) {
	dls[i].mark=false;	//给每一行的dl标签添加一条属性，用于对应下面的dd标签。我们约定如果这个属性的值为true表示对应的标签没有创建。如果值为false表示对应的标签已经创建了
	select(i);
}

function select(n) {
	var dds = dls[n].querySelectorAll('dd');
	var prev=null;
	var dd=null;	//每一行都需要创建一个dd标签，放到这里是为了如果标签已经被创建了，通过这个变量能够找到这个标签

	for (var i = 0; i < dds.length; i++) {
		dds[i].onclick = function () {
			//给当前点击的添加一个高亮
			//prev && (prev.className = '');

			if(prev){
				prev.className = ''
			}

			this.className = 'active';

			prev = this;

			//创建dd标签
			var parent=this.parentNode;
			if(!parent.mark){	//这个条件满足说明对应的dd标签还没有创建
				dd=document.createElement('dd');
				dd.innerHTML=this.innerHTML;
				selected.appendChild(dd);

				parent.mark=true;

			}else{
				//走这里的时候说明对应的标签已经创建了，只需要把内容修改了就可以了
				dd.innerHTML=this.innerHTML;
			}

			var span=document.createElement('span');
			var This=this;
			span.innerHTML='X';
			span.onclick=function(){
				//alert(1);
				/*
					点击关闭后要做的事情
						1、移除掉dd
						2、把上面点击的那个class去掉
						3、父级身上的mark属性要更新
				 */
				selected.removeChild(dd);
				This.className='';
				parent.mark=false;
			};
			dd.appendChild(span);
		};
	}
}