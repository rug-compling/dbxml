/*
 * Copyright (c) 2001-2008
 *     DecisionSoft Limited. All rights reserved.
 * Copyright (c) 2004-2008
 *     Oracle. All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * $Id: Except.hpp 659 2008-10-06 00:11:22Z jpcs $
 */

/*

   Op Except 
The except operator takes two node sequences as operands and returns a sequence containing all the nodes that occur in the first operand
but not in the second operand
*/

#ifndef _EXCEPT_HPP
#define _EXCEPT_HPP

#include <xqilla/framework/XQillaExport.hpp>

#include <xqilla/ast/XQOperator.hpp>
#include <xqilla/ast/XQNav.hpp>
#include <xqilla/runtime/ResultBuffer.hpp>

class XQILLA_API Except : public XQOperator
{
public:
  static const XMLCh name[];

  Except(const VectorOfASTNodes &args, XPath2MemoryManager* memMgr);
  
  ASTNode* staticResolution(StaticContext *context);
  virtual ASTNode *staticTypingImpl(StaticContext *context);
  Result createResult(DynamicContext* context, int flags=0) const;

private:
  class ExceptResult : public ResultImpl
  {
  public:
    ExceptResult(const Except *op, int flags);

    Item::Ptr next(DynamicContext *context);
  private:
    const Except *_op;
    unsigned int _flags;
    bool _toDo;
    Result _result;
    ResultBuffer _excpt;
  };

  bool sortAdded_;
};

#endif 
