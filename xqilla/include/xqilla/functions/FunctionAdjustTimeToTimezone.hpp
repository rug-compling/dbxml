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
 * $Id: FunctionAdjustTimeToTimezone.hpp 659 2008-10-06 00:11:22Z jpcs $
 */

#ifndef _FUNCTIONADJUSTTIMETOTIMEZONE_HPP
#define _FUNCTIONADJUSTTIMETOTIMEZONE_HPP

#include <xqilla/framework/XQillaExport.hpp>

#include <xqilla/ast/XQFunction.hpp>

/**
 * Adjusts a time to a specific timezone, or to no timezone at all
 *
 *  fn:adjust-time-to-timezone(time? $srcval) => time?
 *  fn:adjust-time-to-timezone(time? $srcval, dayTimeDuration? $timezone) => time?
 */
class XQILLA_API FunctionAdjustTimeToTimezone : public XQFunction
{
public:
  static const XMLCh name[];
  static const unsigned int minArgs;
  static const unsigned int maxArgs;

  /**
   * Constructor
   */
   FunctionAdjustTimeToTimezone(const VectorOfASTNodes &args, XPath2MemoryManager* memMgr);

  /**
   * Called during static analysis to determine if statically correct.
   * Performs constant folding if the function has two arguments, and
   * they are constant.
   */
  virtual ASTNode* staticResolution(StaticContext *context);
  virtual ASTNode *staticTypingImpl(StaticContext *context);

  /**
   * Adjusts a time to a specific timezone, or to no timezone at all
   */
  Sequence createSequence(DynamicContext* context, int flags=0) const;
};

#endif // _FUNCTIONADJUSTTIMETOTIMEZONE_HPP
