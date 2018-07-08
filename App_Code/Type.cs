using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Type 的摘要说明
/// </summary>
public class Type
{
    public int TypeId { get; set; }
    public string TypeName { get; set; }
	public Type()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    public Type(int typeid, string typename)
    {
        this.TypeId = typeid;
        this.TypeName = typename;
    }
}